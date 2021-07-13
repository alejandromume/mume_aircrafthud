

$(function(){

    window.addEventListener("message", function(event){

        if ( event.data.coche == false ) {
            var selector = document.querySelector("html")
            selector.style = "display:none;"
            
        }
        if ( event.data.coche == true ) {
            var selector = document.querySelector("html")
            selector.style = "display:block;"
            
        }

        $("#velocidad").html(Math.round(event.data.vel) + "");
        $("#roll").html(Math.round(event.data.roll) + "º");
        $("#fuel").css("width", (event.data.gasolina) * 2 + "");
        $("#altura").html(event.data.altura + "m");
        $("#streetName").html(event.data.streetName + "");
        $("#pitch").html(event.data.pitch + "º");
        $("#time").html(event.data.time + "");
        $("#vida").css("opacity", (event.data.vida) / 10 + "%");


    })
        
})

document.addEventListener("DOMContentLoaded", () => {
    $("html").hide();
});
