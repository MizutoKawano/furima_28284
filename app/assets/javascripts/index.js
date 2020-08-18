
 $(function(){
    $("#price_clac").on("input",function(){
     let price = $("#price_clac").val();
     if( 300 <= price && price <= 9999999) {
     let fee = Math.floor(price / 10);
     let profit = (price - fee);
     $("#fee-span").text(fee);
     $("#profit-span").text(profit);
      }else{
     $("#fee-span").text('0');
    $("#profit-span").text('0');
       }
     })
   });