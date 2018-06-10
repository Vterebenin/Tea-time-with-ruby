example_200 = {
  path: '/admin/rubrics',
  time: '2018-03-02 12:10:34 +0300',
  http_status: '200',
  http_method: 'POST',
  parameters: {"rubric"=>{"title"=>"111", "locator"=>"111"}},
  processing: {
    by: 'Admin::RubricsController#create',
    as: 'JS'
  },
  current_user_id: '123',
  app_environment: 'production'
}

example_payment = {
  path: '/users/23/orders/65/pay',
  time: '2018-03-02 12:10:34 +0300',
  http_status: '200',
  http_method: 'POST',
  parameters: {},
  processing: {
    by: 'PayController#create',
    as: 'HTML'
  },
  current_user_id: '23',
  app_environment: 'production'
}

example_404 = {
  path: '/rubrics/9934',
  time: '2018-03-02 13:10:34 +0300',
  http_status: '404',
  http_method: 'GET',
  parameters: {},
  processing: {
    by: 'RubricsController#show',
    as: 'HTML'
  },
  current_user_id: nil,
  app_environment: 'production'
}

example_500 = {
  path: '/admin/rubrics/9934',
  time: '2018-03-02 13:10:34 +0300',
  http_status: '500',
  http_method: 'PATCH',
  parameters: {"rubric"=>{"title"=>"", "locator"=>""}},
  processing: {
    by: 'Admin::RubricsController#update',
    as: 'HTML'
  },
  current_user_id: '101',
  error: {
    message: 'Neo4j::ActiveNode::Persistence::RecordInvalidError: Title can\'t be blank, Locator can\'t be blank',
    backtrace: "from ~/.rvm/gems/ruby-2.4.0@my_app/gems/neo4j-9.0.7/lib/neo4j/active_node/persistence.rb:50:in `save!'...."
  },
  app_environment: 'production'
}