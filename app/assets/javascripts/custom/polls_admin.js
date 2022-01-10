(function () {
  "use strict";
  App.PollsAdmin = {
    initialize: function () {
      $("select[class='js-poll-shifts']").on({
        change: function () {
          switch ($(this).val()) {
            case "vote_collection":
              $("select[class='js-shift-vote-collection-dates']").show();
              $("select[class='js-shift-recount-scrutiny-dates']").hide();
              break;
            case "recount_scrutiny":
              $("select[class='js-shift-recount-scrutiny-dates']").show();
              $("select[class='js-shift-vote-collection-dates']").hide();
          }
        },
      });
      $("input[id='poll_method_simple']").on({
        change: function () {
          if ($(this).val() === "simple") {
            $("input[id='poll_max_score']").hide();
            $("input[id='poll_max_score']").val(null);
            $("input[id='poll_max_score']").prop("required", false);
            $("input[id='poll_max_answers']").hide();
            $("input[id='poll_max_answers']").val(null);
            $("input[id='poll_max_answers']").prop("required", false);
          }
        },
      });
      $("input[id='poll_method_score']").on({
        change: function () {
          if ($(this).val() === "score") {
            $("input[id='poll_max_score']").show();
            $("input[id='poll_max_score']").prop("required", true);
            $("input[id='poll_max_answers']").hide();
            $("input[id='poll_max_answers']").val(null);
            $("input[id='poll_max_answers']").prop("required", false);
          }
        },
      });
      $("input[id='poll_method_multiple']").on({
        change: function () {
          if ($(this).val() === "multiple") {
            $("input[id='poll_max_answers']").show();
            $("input[id='poll_max_answers']").prop("required", true);
            $("input[id='poll_max_score']").hide();
            $("input[id='poll_max_score']").val(null);
            $("input[id='poll_max_score']").prop("required", false);
          }
        },
      });
    },
  };
}.call(this));
