defmodule Tax do
    def income_tax(salary) when salary <= 2000 do
        0
    end
    def income_tax(salary) when salary <= 3000 do
        salary*0.05
    end
    def income_tax(salary) when salary <= 6000 do
        salary*0.1
    end
    def income_tax(salary)do
        salary*0.15
    end

    def net_wage(salary) do
      salary - income_tax(salary)
    end

    def itax() do
        user_input = IO.gets "Your income: "

        _result = case Integer.parse(user_input) do
            :error ->
                "Invalid ability score: #{user_input}"
            {salary, _} ->
                tax = income_tax(salary)
                net_wage = net_wage(salary)
                "Your income tax is #{tax} and your net wage is #{net_wage}"
        end
    end
end
