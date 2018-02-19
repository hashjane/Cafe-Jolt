<p id="notice"><%= notice %></p>

<h1>Menu Items</h1>

<table>
  <thead>
    <tr>
      <th>Id</th>
      <th>Kind</th>
      <th>Name</th>
      <th>Description</th>
      <th>Stock level</th>
      <th colspan="3"></th>
    </tr>
  </thead>

  <tbody>
    <% @menu_items.each do |menu_item| %>
      <tr>
        <td><%= menu_item.id %></td>
        <td><%= menu_item.kind %></td>
        <td><%= menu_item.name %></td>
        <td><%= menu_item.description %></td>
        <td><%= menu_item.stock_level %></td>
        <td><%= link_to 'Show', menu_item %></td>
        <td><%= link_to 'Edit', edit_menu_item_path(menu_item) %></td>
        <td><%= link_to 'Destroy', menu_item, method: :delete, data: { confirm: 'Are you sure?' } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to 'New Menu Item', new_menu_item_path %>
