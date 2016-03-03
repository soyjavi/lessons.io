import React from 'react';
// -- Context
import style from './style.scss';

const Particles = props => {
  const className = `${style.root} ${props.className}`
  return (
    <div id='particles-js' className={className} />
  );
};

Particles.propTypes = {
  className: React.PropTypes.string
};

Particles.defaultProps = {
  className: ''
};

export default Particles;
