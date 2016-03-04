import React from 'react';
// -- Components
import Item from './PricePlan.Item.jsx'
// -- Context
import style from './style.scss';

const PricePlan = props => {
  return (
    <ul className={style.root}>
      <Item type='monthly' price={9} />
      <Item type='yearly' price={82} />
    </ul>
  );
};

export default PricePlan;
