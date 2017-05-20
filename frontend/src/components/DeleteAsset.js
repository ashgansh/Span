import React from 'react';
import PropTypes from 'prop-types';
import { gql, graphql, compose } from 'react-apollo';

const Delete = ({ assetID, deleteAsset }) => (
  <div>
    <button onClick={() => deleteAsset({ id: assetID })}>{assetID}</button>
  </div>
);

Delete.propTypes = {
  assetID: PropTypes.number.isRequired,
  deleteAsset: PropTypes.func.isRequired,
};

const deleteAssetMutation = gql`
  mutation deleteAsset($id: ID!) {
    deleteAsset(id: $id) {
      id
      name
    }
}`;

const updateQueries = {
  hello: (prev, { mutationResult }) => {
    const oldAsset = mutationResult.data.deleteAsset;
    const itemToRemove = prev.assets.findIndex((asset) => asset.id === oldAsset.id);
    prev.assets.splice(itemToRemove, 1);
    return prev;
  },
};

export const withDelete = compose(
  graphql(deleteAssetMutation, {
    props: ({ mutate }) => ({
      deleteAsset: (id) => mutate({
        variables: { id: id.id },
        updateQueries,
      }),
    }),
  },
));

export default withDelete(Delete);
