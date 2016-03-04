import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const PricePlanItem = props => {
  return (
    <li className={style.item} >
      <h3>{props.type}</h3>
      <strong><small>$</small>{props.price}</strong>
      <Link
        to='/join/yearly'
        className={style.button}
        onClick={PricePlanItem.handleClick.bind(null, props)}
      >
        Looks good for me
      </Link>
    </li>
  );
};

PricePlanItem.propTypes = {
  price: React.PropTypes.number,
  type: React.PropTypes.string
};

PricePlanItem.handleClick = function (props, event) {
  event.preventDefault();
  console.log('handleClick', props.type, props.price);

  var handler = StripeCheckout.configure({
    key: 'pk_test_LcgTkqgfwpiRhaGA3OZJmrAp',
    image: '/img/stripe-logo.png',
    locale: 'auto',
    token: function(token) {
      // Use the token to create the charge with a server-side script.
      // You can access the token ID with `token.id`
      parameters = {toke}
    }
  });

  handler.open({
    name: 'hackvolt',
    description: `${props.type.toUpperCase()} Subscription`,
    currency: 'USD',
    amount: props.price.toString().replace('.', '')
  });

  // Close Checkout on page navigation
  window.addEventListener('popstate', function() {
    handler.close();
  });

  // stripe = StripeCheckout.configure(
  //   key   : @order.settings.payments.stripe.publishable_key
  //   image : "/img/stripe.png"
  //   token : (token) =>
  //     parameters =
  //       id    : @order.id
  //       token : token.id
  //       type  : 1
  //     __.proxy("PUT", "order/checkout", parameters).then (error, response) ->
  //       if error
  //         __.Dialog.Success.show "cross", "Something was wrong"
  //       else
  //         __.Dialog.Success.show "checkmark", "Order accepted"
  //         setTimeout (=> window.location = "/profile"), 3000
  // window.addEventListener "popstate", => @stripe.close()
}

export default PricePlanItem;
