import React from 'react';
import PropTypes from 'prop-types';
import { gql, graphql, compose } from 'react-apollo';
import List from './List';
import Delete from './DeleteAsset';


const renderAsset = (asset, index) => (
  <List key={index}>
    <Delete assetID={parseInt(asset.id, 10)} />
    <div>{asset.name} @ {asset.location}</div>
  </List>
);


export const Assets = ({ data: { loading, assets, error } }) => {
  if (loading) return <div>Loading</div>;
  if (error) return <div>ERROR</div>;
  if (assets && assets.length === 0) return <div>No Assets</div>;
  return (
    <div>
      <ul>
        {assets && assets.map((asset, index) => renderAsset(asset, index))}
      </ul>
    </div>
  );
};

Assets.propTypes = {
  data: PropTypes.shape({
    loading: PropTypes.bool.isRequired,
    assets: PropTypes.array,
    error: PropTypes.bool,
  }).isRequired,
};


export const assetsQuery = gql`
query hello{
  assets {
    id
    name
    location
  }
}`;

export const withAsset = compose(
graphql(assetsQuery),
);

export default withAsset(Assets);
