const LinkedList = () => {

  let head = null
  let tail = null

  const Node = (data, next, previous) => {
    return { data, next, previous }
  }

  const count = () => {
    let counter = head
    let listSize = 0
    while (counter != null && counter.data != null) {
      listSize++
      counter = counter.next
    }
    return listSize
  }

  const push = (obj) => {
    let newNode = new Node(obj, null, null)
    if (!head) {
      head = newNode
      tail = newNode
    } else {
      newNode.previous = tail
      tail.next = newNode
      tail = newNode
    }
  }

  const pop = () => {
    let output = tail.data;
    if (!head) {
      throw (new Error ("Can not pop an empty list"))
    } else if (tail != head) {
      tail = tail.previous
      tail.next = null
    } else {
      output = head.data
      head = null
      tail = null
    }
    return output
  }

  const shift = () => {
    let output = head.data;
    if (!head) {
      throw (new Error ("Can not shift an empty list"))
    } else if (head != tail) {
      head = head.next
      head.previous = null
    } else {
      output = tail.data
      head = null
      tail = null
    }
    return output
  }

  const unshift = (obj) => {
    let newNode = new Node(obj, null, null)
    if (!head) {
      head = newNode
      tail = newNode
    } else {
      newNode.next = head
      head.previous = newNode
      head = newNode
    }
  }

  const deleteValue = (obj) => {

  }

  return { push, pop, shift, unshift, count, deleteValue }
}

export default LinkedList
