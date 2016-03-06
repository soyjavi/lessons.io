import React from 'react';
// -- Context
import style from './style.scss';

const Input = props => {
  const className = `${style.root} ${props.className}`
  return (
    <input {...props} className={className}/>
  );
};

Input.propTypes = {
  className: React.PropTypes.string
};

Input.defaultProps = {
  className: ''
};

export default Input;
