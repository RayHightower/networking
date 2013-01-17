class MainController < UIViewController

  def viewDidLoad
    add_photos

    #testing the scroll_view
    #add_scroll_view(10)
    #add_page_control(10)
    #(0..9).each do |i|
    #  new_view = UIView.alloc.initWithFrame(CGRect.make(x: i * view.frame.width, y:0, width: view.frame.width, height: view.frame.height))
    #  new_view.backgroundColor = [rand * 255, rand * 255, rand * 255].uicolor
    #  @scroll_view << new_view
    #end
  end

  def scrollViewDidScroll(scroll_view)
    page_width = scroll_view.frame.size.width
    page = ((scroll_view.contentOffset.x - page_width / 2) / page_width).floor + 1
    @page_control.currentPage = page
  end

  private
  def add_photos
    Photo.recent do |photos|
      add_scroll_view(photos.count)
      add_page_control(photos.count)

      photos.each_with_index do |photo, i|
        frame = [[view.frame.width * i, 0],[photo.width, photo.height]]
        image_view = UIImageView.alloc.initWithFrame frame
        image_view.url = photo.url
        @scroll_view << image_view
      end
    end
  end

  def add_scroll_view(number_of_pages)
    @scroll_view = UIScrollView.alloc.initWithFrame(
        CGRect.make(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    @scroll_view.contentSize = CGSizeMake(view.bounds.width * number_of_pages, view.frame.height)
    @scroll_view.pagingEnabled = true
    @scroll_view.delegate = self
    view << @scroll_view
  end

  def add_page_control(number_of_pages)
    @page_control = UIPageControl.alloc.initWithFrame [[110,340], [100, 20]]
    @page_control.numberOfPages = number_of_pages
    view << @page_control
  end

end