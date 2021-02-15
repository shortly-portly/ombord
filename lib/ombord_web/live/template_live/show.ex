defmodule OmbordWeb.TemplateLive.Show do
  use OmbordWeb, :live_view

  alias Ombord.Templates
  alias Ombord.Activities.Activity

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Template")
    |> assign(:template, Templates.get_template!(id))
  end

  defp apply_action(socket, :show, %{"id" => id}) do
    socket
    |> assign(:page_title, "Show Template")
    |> assign(:template, Templates.get_template!(id))
  end

  defp apply_action(socket, :new_activity, %{"id" => id}) do
    socket
    |> assign(:page_title, "New Activity")
    |> assign(:template, Templates.get_template!(id))
    |> assign(:activity, %Activity{})
  end
end
