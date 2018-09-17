const LinkedList = () => {

  // This will be interesting with ES6 and function factory structure

  // Refactor with methods to set head and set tail





  const node = (data, next, previous) => {
    return { data, next, previous }
  }

  let head = new node(null,null,null)
  let tail = new node(null,null,null)

  const count = () => {
    let node = head
    let listSize = 0
    while (node != null && node.data != null) {
      listSize++
      node = node.next
    }
    return listSize
  }

  const push = (obj) => {
    if (head.data == null) { //first node
      head.data = obj
      head.next = tail
    } else if (tail.data == null) { //second node
      tail.data = obj
      tail.previous = head
    } else {
      let newNode = new node(obj, null, tail)
      tail.next = newNode
      tail = newNode
    }
  }

  const pop = () => {
    let output = tail.data;
    if (output == null) {
      throw (new Error ("Can not pop an empty list"))
    } else {
      if (tail != head) {
        tail = tail.previous
        tail.next = null
      } else {
        output = head.data
      }
    }
    return output
  }

  const shift = () => {
    let output = head.data;
    if (output == null) {
      throw (new Error ("Can not shift an empty list"))
    } else {
      if (head != tail) {
        head = head.next
        head.previous = null
      } else {
        output = tail.data
      }
    }
    return output
  }

  const unshift = (obj) => {
    if (tail.data == null) { //first node
      tail.data = obj
      tail.previous = head
    } else if (head.data == null) { //second node
      head.data = obj
      head.next = tail
    } else {
      let newNode = new node(obj, head, null)
      head = newNode
    }
  }

  return { push, pop, shift, unshift, count }
}

export default LinkedList
