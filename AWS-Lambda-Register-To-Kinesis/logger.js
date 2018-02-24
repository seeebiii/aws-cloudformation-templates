module.exports.handler = function(event, context, callback) {
    console.log('Handling event: ', JSON.stringify(event));

    let data = Buffer.from(event.Records[0].kinesis.data, 'base64');
    console.log('Record data: ', data.toString());

    setTimeout(() => {
        console.log('Waited 1 second to imitate data processing...');
    }, 1000);
};
