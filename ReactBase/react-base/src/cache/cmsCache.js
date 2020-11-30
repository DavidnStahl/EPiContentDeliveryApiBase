
export function getCache(key){
    var item =  JSON.parse(localStorage.getItem(key))

    if(!item)
    {
        return null;
    }

    const now = new Date()

    if (now.getTime() > item.expire) 
    {
        localStorage.removeItem(key)
        return null
    }
    
    return item.data
}

export function saveDataToCache(key, data){
    const now = new Date()

    const item = {
        data: data,
        expire: (now.getTime() + 1000 * 60)
    }

    localStorage.setItem(key,JSON.stringify(item))
}


