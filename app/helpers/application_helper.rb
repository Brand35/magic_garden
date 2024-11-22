module ApplicationHelper
  def flash_class(key)
    case key.to_s
    when 'notice' then 'info'    # Style Bootstrap pour info (bleu)
    when 'alert'  then 'warning' # Style Bootstrap pour alerte (jaune)
    when 'success' then 'success' # Style Bootstrap pour succès (vert)
    when 'error' then 'danger'   # Style Bootstrap pour erreur (rouge)
    else 'secondary'             # Style par défaut
    end
  end
end
