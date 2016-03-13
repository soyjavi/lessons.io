import React from 'react';
import { Link } from 'react-router';
// -- Context
import style from './Series.Item.scss';

const SeriesItem = props => {
  const stylesheet = {
    backgroundImage: `url(${props.thumbnail})`
  };
  return (
    <Link to={`/series/${props.url}`}>
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
  lessons: React.PropTypes.number,
  level: React.PropTypes.string,
  thumbnail: React.PropTypes.string,
  title: React.PropTypes.string,
  url: React.PropTypes.string
};

export default SeriesItem;
