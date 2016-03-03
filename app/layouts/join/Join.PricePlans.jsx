import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const Join = props => {
  return (
    <ul className={style.PricePlans}>
      <li className={style.PricePlan}>
        <h3>monthly</h3>
        <strong><small>$</small>9</strong>
        <Link to='/join/monthly' className={style.button}>Looks good for me</Link>
      </li>
      <li className={style.PricePlan}>
        <h3>yearly</h3>
        <strong><small>$</small>82</strong>
        <Link to='/join/yearly' className={style.button}>Looks good for me</Link>
      </li>
    </ul>
  );
};

export default Join;
