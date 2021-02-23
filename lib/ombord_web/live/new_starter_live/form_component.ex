defmodule OmbordWeb.NewStarterLive.FormComponent do
  use OmbordWeb, :live_component

  alias Ombord.Accounts

  @impl true
  def update(%{user: user} = assigns, socket) do
    changeset = Accounts.change_new_starter_registration(user)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset =
      socket.assigns.user
      |> Accounts.change_new_starter_registration(user_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"user" => user_params}, socket) do
    save_user(socket, socket.assigns.action, user_params)
  end

  defp save_user(socket, :edit, _user_params) do
    {:noreply, socket}
  end

  defp save_user(socket, :new, user_params) do
    case Accounts.register_new_starter(user_params) do
      {:ok, user} ->
        {:noreply,
         socket
         |> put_flash(:info, "User created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
