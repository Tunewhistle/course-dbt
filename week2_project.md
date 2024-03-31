## 1. Create a bunch of intermediate and mart models. 
The idea behind the dependencies is to try to make intermediate layers reference staging layer's models, and marts' layer's models reference intermediate layer's models.

**int_product_events's granularity** is purchased product per order per event per row, people can explore questions about purchased products related to user event journey with this intermediate model.

**int_user_orders** is the user's detailed purchase information. It can be used to analyse related to user's purchases.
Below is the screenshot of dag of fact_user_orders.
![Capture](https://github.com/Tunewhistle/course-dbt/assets/32718047/cf213dbb-ed4c-4517-8a07-9ab89e133fc8)

## 2. Try out some tests to intermediate models.
## 3. Run products_snapshot.
