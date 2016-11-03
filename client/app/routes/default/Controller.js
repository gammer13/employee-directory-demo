import {Controller} from 'cx/ui/Controller';
import {queryEmployees} from 'app/api/index'

export default class extends Controller {
    init() {
        this.addTrigger('search', ['search.query', '$page.dataVersion'], ::this.load, true);
    }

    load() {
        var q = this.store.get('search.query');
        var options = {
            q: q || ''
        };
        queryEmployees(options)
            .then(data=> {
                this.store.set('$page.data', data);
            })
    }
}
