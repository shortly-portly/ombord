defmodule OmbordWeb.UserRegistrationController do
  use OmbordWeb, :controller

  alias Ombord.Accounts
  alias Ombord.Accounts.User
  alias Ombord.Templates
  alias OmbordWeb.UserAuth

  def new(conn, _params) do
    changeset = Accounts.change_user_registration(%User{})
    templates = Templates.select_templates()
    render(conn, "new.html", changeset: changeset, templates: templates)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        {:ok, _} =
          Accounts.deliver_user_confirmation_instructions(
            user,
            &Routes.user_confirmation_url(conn, :confirm, &1)
          )

        conn
        |> put_flash(:info, "User created successfully.")
        |> UserAuth.log_in_user(user)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
