import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const Button = props => {
  const { accent, href, caption, legend, children, onClick, ...others } = props;
  const element = href ? Link : 'button';
  let className = style.root;

  const properties = {
    to: href,
    onClick: onClick,
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
  legend: React.PropTypes.string,
  onClick: React.PropTypes.func
};

export default Button;
