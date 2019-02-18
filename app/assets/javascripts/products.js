$(document).on('turbolinks:load', function() {
  $(function() {

    function appendProduct(product) {
     var html = `<div class = "item">
                  <div class = "item__image">
                    <a href="/products/${ product.id }"><img src=${ product.image_url } class="activator" ></a>
                  </div>
                  <div class = "item__bottom">
                    <div class = "item__bottom__title">
                      <a href = "/products/${ product.id }">${ product.title }
                      </a>
                    </div>
                    <div class = "item__bottom__time">
                      <a>${ product.date }</a>
                    </div>
                  </div>
                </div>`
     $(".items").append(html);
    }

    $(".search__input").on("keyup", function() {
      var input = $(this).val();

      $.ajax({
        type: "GET",
        url: "/",
        data: { keyword: input },
        dataType: 'json'
      })

      .done(function(products) {
        $(".items").empty();
        if (products.length !== 0) {
          products.forEach(function(product){
            appendProduct(product);
          });
        }
      })
      .fail(function() {
        alert('検索に失敗しました');
      })
    });
  });
});
