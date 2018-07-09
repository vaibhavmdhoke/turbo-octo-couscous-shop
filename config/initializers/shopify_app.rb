ShopifyApp.configure do |config|
  config.application_name = 'My Shopify App'
  config.api_key = 'aa4eca9ba9d2aacf911e90703cc1bd37'
  config.secret = '7de40b52c0a75c8507b7da16d3403830'
  config.scope = 'read_orders, read_products'
  config.embedded_app = true
  config.after_authenticate_job = false
  config.session_repository = Shop

  config.webhooks = [
    { topic: 'orders/create', address: 'https://young-headland-58413.herokuapp.com/webhooks/order_create', format: 'json' }
  ]
end
