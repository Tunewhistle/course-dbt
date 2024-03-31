1. Create a bunch of intermediate and mart models. 
The idea behind the dependencies is try to make intermediate layers reference staging layer's models, and marts' layer's models reference intermediate layer's models.

int_product_events's granularity is purchased product per order per event per row, people can explore questions about purchased products related to user event journey with this intermediate model.
int_user_orders is user's detailed purchase information. It can be used to analyse related to user's purchases.

2. Try out some tests to intermediate models.
