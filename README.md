To reproduce [https://github.com/activeadmin/activeadmin/issues/4000] do the following

1. `rake db:migrate`
2. `rake db:seed`
3. `rails s`
4. Browse to http://localhost:3000/admin/posts
5. Filter by one of the categories
6. Select the batch action "Feature posts Selected"
7. Check the "apply_to_hidden_pages" box
8. Submit

You'll see that the batch action applies to all 501 records, rather than the 100 that meet the filter criteria.

It was my understanding that batch_action_collection was supposed to only include the filtered record set.
