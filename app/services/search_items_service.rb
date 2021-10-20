class SearchItemsService
  def self.search(search)
    if search != ''
      item = Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
