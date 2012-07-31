Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_digital_samples_to_product",
                     :insert_bottom => "[data-hook='product_properties']",
                     :text => %q{
 <%= content_tag(:p, :class => 'download_links') do %>
   
   <% if @product.has_variants? %>
     
       <% @product.variants.each do |variant| %>
         <% if variant.has_digitals? %>
           This product is available in the following formats:
           <%= render variant.digitals %>
         <% end %>
         
         <% if variant.has_digital_sampless? %>
            <br/><br/>This product has the following Free Downloads:
            <%= render variant.digital_samples %>
         <% end %>
         
       <% end %>
      
   <% else %>

     <% if @product.master.digital? %>
       This product is available in the following formats:
       <%= render @product.master.digitals %>
     <% end %>

     <% if @product.master.digital_sample? %>
       <br/><br/>This product has the following Free Downloads:
        <ul>
          <% @product.master.digital_samples.each do |digital_sample| %>
            <li>
            <%= link_to digital_sample.attachment.original_filename, digital_sample.attachment.url %>
            </li>
         <% end %>
     <% end %>



   <% end %>
   
 <% end %>
             
                      },
                     :disabled => false)