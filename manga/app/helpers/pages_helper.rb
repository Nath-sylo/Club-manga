module PagesHelper
  /
	def sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
      :url => {:action => 'liste_inscrits', :params => params.merge({:sort => key, :page => nil})},
      :update => 'table',
      :before => "Element.show('spinner')",
      :success => "Element.hide('spinner')"
    }
    html_options = {
      :title => "Trier selon ce champ",
      :href => url_for(:action => 'liste_inscrits', :params => params.merge({:sort => key, :page => nil}))
    }
    link_to(text, options, html_options)
  end
  /
end
