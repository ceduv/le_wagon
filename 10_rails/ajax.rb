#============ AJAX ==============

support both AJAX requests and
classic requests expecting an HTML file

respond_to do |format|
    if @review.save
      format.html { redirect_to restaurant_path(@restaurant) }
      format.json # Follows the classic Rails flow and renders `app/views/reviews/create.json`
    else
      format.html { render 'restaurants/show' }
      format.json # Follows the classic Rails flow and renders `app/views/reviews/create.json`
    end
  end