defmodule OmbordWeb.NewStarterLive.Index do
  use OmbordWeb, :live_view

  alias Ombord.Packs
  alias Ombord.Accounts.User

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:new_starters, Packs.list_packs())
      |> assign(:user, %User{})

    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Activities")
    |> assign(:activity, nil)
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Starter")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit New Starter")
    |> assign(:activity, Packs.get_pack!(id))
  end
end
