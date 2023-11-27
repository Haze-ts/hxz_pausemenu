window.addEventListener('message', (event) => {
	let data = event.data

	if(data.action == 'open') {
		$('.tuttocazzonculog').fadeIn()
        $('.nomecristiano').text(data.name.toUpperCase() + " " + data.surname.toUpperCase())
        $('#id').text('ID: ' + data.id)
        $('#date').text(data.date)
    }else if(data.action == 'close'){
        $('.tuttocazzonculog').fadeOut()
        $('.parte-rules').fadeOut()
    }
})

$(function(e){
    $('#settings').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('impostazioni')
        );
    });
    $('#changepg').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('cambiapg')
        );
    });
    $('#mappa').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('mappa')
        );
    });
    $('#rules').click(function(e) {
        $('.tuttocazzonculog').fadeOut()
        setTimeout(() => {
            $('.parte-rules').fadeIn()
        }, 500);
    });

    $('#x').click(function(e) {
        $.post(`https://${GetParentResourceName()}/Close`);
    });
})

$(document).keydown(function(e) {
    if (e.key === "Escape" || e.key === "Backspace") { // escape key maps to keycode `27`
        $.post(`https://${GetParentResourceName()}/Close`);
    }
});
