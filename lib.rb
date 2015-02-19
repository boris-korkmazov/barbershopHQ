def render_partial view
  view = (:"partials/".to_s + view.to_s).to_sym
  erb(view, :layout => false)
end