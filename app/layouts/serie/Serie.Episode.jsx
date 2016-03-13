import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './Serie.Episode.scss';

const Episode = props => {
  return (
    <Link to={`/series/${props.url}/episodes/${props.number}`} className={style.root}>
      <small className={style.number}>{props.number}</small>
      <h6 className={style.title}>{props.title}</h6>
      <span className={style.length}>{props.length}</span>
    </Link>
  );
};

Episode.propTypes = {
  length: React.PropTypes.number,
  number: React.PropTypes.number,
  title: React.PropTypes.string,
  url: React.PropTypes.string
};

export default Episode;
