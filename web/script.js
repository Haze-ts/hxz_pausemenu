window.addEventListener('message', (event) => {
	let data = event.data

	if(data.action == 'open') {
		$('#content-container').fadeIn()
        $('#infoname').text(data.name.toUpperCase() + " " + data.surname.toUpperCase())
        $('#id').text('ID: ' + data.id)
        $('#date').text(data.date)
    }else if(data.action == 'close'){
        $('#content-container').fadeOut()
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
})

$(document).keydown(function(e) {
    if (e.key === "Escape" || e.key === "Backspace") { // escape key maps to keycode `27`
        $.post(`https://${GetParentResourceName()}/Close`);
    }
});
