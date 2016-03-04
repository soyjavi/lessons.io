import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const Button = props => {
  const { accent, href, caption, legend, children, ...others } = props;
  const element = href ? Link : 'button';
  let className = style.root;

  const properties = {
    to: href,
    className: `${style.root} ${accent ? style.accent : ''}`
  };

  return React.createElement(element, properties,
    <strong>{caption}</strong>,
    <small>{legend}</small>
  );
};

Button.propTypes = {
  caption: React.PropTypes.string,
  href: React.PropTypes.string,
  legend: React.PropTypes.string
};

export default Button;
