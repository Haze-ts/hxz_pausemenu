window.addEventListener('message', (event) => {
	let data = event.data

	if(data.action == 'open') {
		$('#content-container').fadeIn()
        $('#infoname').text(data.name.toUpperCase() + " " + data.surname.toUpperCase())
        $('#id').text('ID: ' + data.id)
        $('#date').text(data.date)
    }else if(data.action == 'close'){
        $('#content-container').fadeOut()
        $('#content-container-rules').fadeOut()
    }
})

$(function(e){
    $('#impostazioni').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('impostazioni')
        );
    });
    $('#changepg').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('cambiapg')
        );
    });
    $('#bigmap_1').click(function(e) {
        $.post(`https://${GetParentResourceName()}/PauseMenu`,
            JSON.stringify('mappa')
        );
    });
    $('#rules').click(function(e) {
        $('#content-container').fadeOut()
        setTimeout(() => {
            $('#content-container-rules').fadeIn()
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
