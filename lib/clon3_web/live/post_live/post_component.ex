defmodule  Clon3Web.PostLive.PostComponent do
    use Clon3Web, :live_component
   
    
    def render(assigns) do 
        ~L"""
        
        <div id="post-<%=@post.id %>" class= "post" >
            <div class= "row" id="p" > 
                <div class= "column column-10"  >
                    <div class="post-avatar" margin:20px; >
                        <i class="fa fa-camera-retro fa-3x" ></i> 
                        <br/>
                    </div>
                </div>
                <div class="column column-90 post-body">
                    <b>@<%= @post.username %>
                    <br/>
                   
                    <%= @post.body %>
                    <br/>
                </div>
                <br/>
            </div>

            <div class="row" id ="R">
                <div class="column" id="L">
                    <br/>
                    <a href="#" phx-click="Like" phx-target="<%= @myself %>"
                        <i class="far fa-heart"></i> <%= @post.likes_count %>
                    </a>
                </div>
                <div class="column">
                    <br/>
                    <a href="#" phx-click="Reposts" phx-target="<%= @myself %>"
                        <i class="far fa-hand-peace"></i><%= @post.reposts_count %>
                    </a>
                </div>
                <div class="column">
                    <br/>
                    <%= live_patch to: Routes.post_index_path(@socket, :edit, @post.id) do %>
                        <i class="far fa-edit"></i> 
                    <% end %>
                    <%= link to: "#", phx_click: "delete", phx_value_id: @post.id do %>
                        <i class="far fa-trash-alt"></i>
                    <% end %>
                </div>
            </div>


        </div>
        """ 
    end 
    
    def handle_event("Like", _, socket) do
      Clon3.Timeline.inc_likes(socket.assigns.post) 
      {:noreply, socket} 

    end
    def handle_event("Reposts", _, socket) do
        Clon3.Timeline.inc_reposts(socket.assigns.post )
    end
end