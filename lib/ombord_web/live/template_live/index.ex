defmodule OmbordWeb.TemplateLive.Index do
  use OmbordWeb, :live_view

  alias Ombord.Templates
  alias Ombord.Templates.Template

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :templates, list_templates())}
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

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Template")
    |> assign(:template, %Template{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Templates")
    |> assign(:template, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    template = Templates.get_template!(id)
    {:ok, _} = Templates.delete_template(template)

    {:noreply, assign(socket, :templates, list_templates())}
  end

  defp list_templates do
    Templates.list_templates()
  end
end
