$(document).on('turbolinks:load', function() {
  $(function() {
    function appendProduct(product) {
     var html = `<div class = "product">
                  <div class = "product__image">
                    <a href="/products/${ product.id }"><img src=${ product.image_url } class="activator" ></a>
                  </div>
                  <div class = "product__bottom">
                    <div class = "product__bottom__title">
                      <a href = "/products/${ product.id }">${ product.title }
                      </a>
                    </div>
                    <div class = "product__bottom__date">
                      <a>${ product.date }</a>
                    </div>
                    <div class = "product__bottom__link">
                      <a href = ${ product.link } >オフィシャルページへ</a>
                    </div>
                  </div>
                </div>`
     $(".products").append(html);
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
        $(".products").empty();
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
