import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './style.scss';

const Button = props => {
  const { accent, href, caption, legend, children, onClick, ...others } = props;
  const element = href ? Link : 'button';
  let className = `${style.root} ${accent ? style.accent : ''} ${others.className}`;

  const properties = {
    to: href,
    onClick: onClick,
    className: className
  };

  return React.createElement(element, properties,
    <strong>{caption}</strong>,
    <small>{legend}</small>
  );
};

Button.propTypes = {
  accent: React.PropTypes.string,
  caption: React.PropTypes.string,
  className: React.PropTypes.string,
  href: React.PropTypes.string,
  legend: React.PropTypes.string,
  onClick: React.PropTypes.func
};

export default Button;
