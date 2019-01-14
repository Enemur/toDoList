// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require vendor/iCheck/icheck.js
//= require_tree .
//= require select2

$(document).ready(function() {
    $("#create-to-do").on("click", function (event) {
        event.preventDefault();
        let project_id = $('.form-select-project').val();
        let text = $(".text-field-form").val();
        if (project_id > 0 && text !== '') {
            $("#form_create_to_do").submit();
        }
    });

    $("#hide-create-to-do").on("click", function (event) {
        event.preventDefault();

        $("#div_create_to_do").hide();
    });

    $("#show_create_to_do").on("click", function (event) {
        event.preventDefault();

        $("#div_create_to_do").show();
    });

    $('input')
        .iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue'
        })
        .on('ifToggled', function (event) {
            let isChecked = $(this).is(':checked');
            let val = $(this).val();

            if (isChecked)
                $('#li-'+val).css("text-decoration", "line-through");
            else
                $('#li-'+val).css("text-decoration", "none");

            $('#form-'+val).submit();
        });

    $('.form-select-project').select2({
        minimumResultsForSearch: -1,
        placeholder: "Категория"
    });
});
