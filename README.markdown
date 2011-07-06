# Abacus Count #

## Synopsis ##

`ActiveRecord::Base#count` and other calculations as subqueries. Instead of nice Rails grouping calculation feature, uses subqueries to return the result with any complex query.

There is a use case when ActiveRecord calculations fail on a valid relation. It's when you use alias values you select, and then use aliases in where or having conditions. That happens because ActiveRecord does calculations by throwing away select values. And when really **do** need to use custom aliases outside select, you definitely **do not** want this kind of optimization. More on that bug in this [pull request](https://github.com/rails/rails/pull/1969).

While it's not fixed, we can use an ultimate way of preventing any calculation issues, suggested by abacus_count. I mean using subqueries.

## Installation ##

In your `Gemfile`:

``` ruby
  gem "abacus_count"
```

and then run `bundle`.

## Usage ##

You now have `abacus` scope on any relation. This scope extends a relation with a calculations patch. With it, each calculation will be performed through subquery and so they won't fail in any case.

``` ruby
  users = User.select("users.id, avg(transactions.amount) as avg_amount").joins(:transactions).group("user_id").having("avg_amount >= 15")
  users.count # will fail
  users.abacus.count # will do

  # with Kaminari
  users.page(params[:page]).per(10) # will fail in count
  users.abacus.page(params[:page]).per(10) # will do
```

### Caveats ###

In `abacus` calculations never return a hash, always a total result. Sometimes, this is just what you want, however.
