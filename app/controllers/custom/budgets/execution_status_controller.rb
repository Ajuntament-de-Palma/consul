module Budgets
  class ExecutionStatusController < ApplicationController
    before_action :load_budget
    before_action :load_heading

    authorize_resource :budget

    def show
      authorize! :read_execution_status, @budget
      @investments = @budget.investments.winners
    end

    private

      def load_budget
        @budget = Budget.find_by_slug_or_id(params[:budget_id]) || Budget.first
      end

      def load_heading
        if @budget.present?
          headings = @budget.headings
          @heading = headings.find_by_slug_or_id(params[:heading_id]) || headings.first
        end
      end
  end
end
