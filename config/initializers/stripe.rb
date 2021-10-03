Rails.configuration.stripe = {
  :publishable_key => 'pk_test_51JekL9BJokwvN27Zhd3mpaMunKRdDHHWQc9yVxESL3BOxZtDGmvqwkkeNc0N5lnOYVSrseJIyvurymasX4j7BssX00mfRaWqv7',
  :secret_key      => ''
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
Stripe.max_network_retries = 2