(function($) {

  $(function() {
    heights = [[0, 0],[0, 0]];

    $rows = $(".row")

    $rows.each(function(index) {
      row = index;
      $(".h-entry", this).each(function(index) {
        article = index;
        heights[row][article] = parseInt($(this).css("height"));
      });
    });

    if(heights[0][0] < heights[0][1]) {
      $(".h-entry", $rows[0]).css("height", heights[0][1])
    }

    if(heights[0][0] > heights[0][1]) {
      $(".h-entry", $rows[0]).css("height", heights[0][1])
    }

    if(heights[1][0] < heights[1][1]) {
      $(".h-entry", $rows[0]).css("height", heights[0][1])
    }

    if(heights[1][0] > heights[1][1]) {
      $(".h-entry", $rows[0]).css("height", heights[0][1])
    }

  });
})(window.jQuery);
