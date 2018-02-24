const Kinesis = require('aws-sdk/clients/kinesis');
const kinesis = new Kinesis();
const kinesisStream = process.env.KINESIS_STREAM || '';

module.exports.handler = (event, context, callback) => {
    console.log('Providing example data to the Kinesis stream...');

    if (!kinesisStream) {
        console.error('No Kinesis stream given.');
    } else {
        // push data to Kinesis - partition key is the same for every second record
        for (let i = 0; i < 5; i++) {
            putRecord('PartitionKey_' + i % 2, 'Data string: ' + i);
        }
    }
};

function putRecord(key, data) {
    console.log('Writing data to Kinesis stream...');

    kinesis.putRecord({
        StreamName: kinesisStream,
        PartitionKey: key,
        Data: data
    }).promise().then(res => {
        console.log('Result: ', res);
    }).catch(err => {
        console.log('Error: ', err);
    });
}