import React from 'react';
// -- Components
import Particles from '../particles'
// -- Context
import style from './style.scss';

const Title = props => {
  return (
    <section className={`${style.root} ${props.className}`}>
      <div className={style.wrapper}>
        { props.caption ? <h1 className={style.caption}>{props.caption}</h1> : null }
        { props.description ? <h4 className={style.description}>{props.description}</h4> : null }
        { props.children }
      </div>
    </section>
  );
};

Title.propTypes = {
  className: React.PropTypes.string,
  caption: React.PropTypes.string,
  description: React.PropTypes.string
};

export default Title;
