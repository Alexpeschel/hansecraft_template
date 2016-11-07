(function($, window) {

  window.StateManager

      //OffCanvas menu
      .addPlugin('*[data-offcanvas="true"]', 'swOffcanvasMenu', ['xs', 's', 'm', 'l', 'xl'])

      // Slide panel
      .addPlugin('.footer--column .column--headline', 'swCollapsePanel', {
          contentSiblingSelector: '.column--content'
      }, ['xs', 's', 'm', 'l', 'xl'])

      .addPlugin('*[data-subcategory-nav="true"]', 'swSubCategoryNav', ['xs', 's', 'm', 'l', 'xl']);

  // Buy button Support for Listing infiniteScroll
  $.subscribe( "plugin/swInfiniteScrolling/onFetchNewPageFinished", function() {
      StateManager.addPlugin('*[data-add-article="true"]', 'swAddArticle');
  });

})(jQuery, window);
