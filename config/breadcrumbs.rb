crumb :root do
  link "Home", root_path
end

crumb :search do
  link "#{params[:keyword]}", search_items_path
  parent :root
end

crumb :item do
  @item = Item.find(params[:id])
  link "#{@item.name}", item_path(@item)
  parent :root
end

crumb :user do
  @user = User.find(params[:id])
  link "#{@user.nickname}", user_path(@user)
  parent :root
end