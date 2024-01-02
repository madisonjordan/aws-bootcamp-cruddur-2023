import './FormErrors.css';
import FormErrorItem from './FormErrorItem';

export default function FormErrors(props) {
    let el_errors = null;

    if(props.errors.length > 0) {
        console.log(props.errors);
        el_errors  = (<div className='errors'>
        {props.errors.map((error_code) => {
         return <FormErrorItem error_code={error_code} />
    })}
    </div>)

    }

    return(
        <div className='errorsWrap'>
            {el_errors}
        </div>)

}
