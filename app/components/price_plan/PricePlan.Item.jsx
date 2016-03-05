import React from 'react';
import Button from '../button';
// -- Context
import style from './style.scss';

const PricePlanItem = props => {
  return (
    <li className={style.item} >
      <h3>{props.type}</h3>
      <strong><small>$</small>{props.price}</strong>
      <Button
        accent
        caption='Looks good for me'
        onClick={PricePlanItem.handleClick.bind(null, props)}
        to='/join/yearly'
      />
    </li>
  );
};

PricePlanItem.propTypes = {
  price: React.PropTypes.number,
  type: React.PropTypes.string
};

PricePlanItem.handleClick = function (props, event) {
  event.preventDefault();

  var handler = StripeCheckout.configure({
    key: 'pk_test_EiD9MlIx1enA5axk2BVqEtjD',
    image: '/img/stripe-logo.png',
    locale: 'auto',
    token: function(token) {
      const parameters = {
        token: token.id,
        type: props.type
      };
      console.log('::call::', parameters);
      handler.close();
    }
  });

  handler.open({
    name: 'hackvolt',
    description: `${props.type.toUpperCase()} Subscription`,
    email: 'demo@mail.com',
    currency: 'USD',
    amount: props.price * 100
  });

  // Close Checkout on page navigation
  window.addEventListener('popstate', function() {
    handler.close();
  });
}

export default PricePlanItem;
