import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './Series.Item.scss';

const SeriesItem = props => {
  const stylesheet = {
    backgroundImage: `url(${props.thumbnail})`
  };
  return (
    <Link to={`/series/${props.url}`} className={props.disabled ? style.disabled : null}>
      <div className={style.root}>
        <figure className={style.thumbnail} style={stylesheet}>
          <small className={style.level}>{props.level}</small>
        </figure>
        <div className={style.info}>
          <h6 className={style.title}>{props.title}</h6>
          <h6 className={style.lessons}>
            <strong>{props.lessons}</strong>
            <small>lessons</small>
          </h6>
        </div>
      </div>
    </Link>
  );
};

SeriesItem.propTypes = {
  disabled: React.PropTypes.bool,
  lessons: React.PropTypes.number,
  level: React.PropTypes.string,
  thumbnail: React.PropTypes.string,
  title: React.PropTypes.string,
  url: React.PropTypes.string
};

export default SeriesItem;
